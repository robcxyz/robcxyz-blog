


```hcl-terraform
data "template_file" "bucket_policy" {
  template = "${file("bucket_policy.json")}"
  vars {
    origin_access_identity_arn = "${aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path}"
    bucket = "${aws_s3_bucket.www_site.arn}"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${var.site_name}-site-logs"
  acl = "log-delivery-write"

  force_destroy = true
}

resource "aws_s3_bucket" "www_site" {
  bucket = "www.${var.site_name}"
  logging {
    //    target_bucket = "www.${var.site_name}"
    target_bucket = "${aws_s3_bucket.logs.bucket}"
  }
  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "www_site_bucket_policy" {
  bucket = "${aws_s3_bucket.www_site.id}"
  policy = "${data.template_file.bucket_policy.rendered}"
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "cloudfront origin access identity"
}

resource "aws_cloudfront_distribution" "website_cdn" {
  enabled = true
  price_class = "PriceClass_200"
  http_version = "http1.1"
  aliases = [
    "www.${var.site_name}"]
  origin {
    origin_id = "origin-bucket-${aws_s3_bucket.www_site.id}"
    domain_name = "www.${var.site_name}.s3.us-east-2.amazonaws.com"
    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path}"
    }
  }
  default_root_object = "index.html"
  default_cache_behavior {
    allowed_methods = [
      "GET",
      "HEAD"]
    cached_methods = [
      "GET",
      "HEAD"]
    target_origin_id = "origin-bucket-${aws_s3_bucket.www_site.id}"
    min_ttl = "0"
    default_ttl = "300"
    //3600
    max_ttl = "1200"
    //86400
    // This redirects any HTTP request to HTTPS. Security first!
    viewer_protocol_policy = "redirect-to-https"
    compress = true
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = "${aws_acm_certificate.cert.arn}"
    ssl_support_method = "sni-only"
  }
  depends_on = [
    "aws_acm_certificate.cert"]
}



resource "aws_route53_zone" "www_site" {
  name = "www.${var.site_name}"
//  private_zone = false
}

resource "aws_route53_record" "www_site" {
  name = "www.robc.rocks"
  type = "A"
//  zone_id = "${aws_route53_zone.www_site.zone_id}"
  zone_id = "${var.zone_id}"
  alias {
    name = "${aws_cloudfront_distribution.website_cdn.domain_name}"
    zone_id = "${aws_cloudfront_distribution.website_cdn.hosted_zone_id}"
    evaluate_target_health = false
  }

}

resource "aws_route53_zone" "zone" {
  name = "${var.root_domain_name}"
}

// This Route53 record will point at our CloudFront distribution.
resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.zone.zone_id}"
  name    = "${var.www_domain_name}"
  type    = "A"

  alias = {
    name                   = "${aws_cloudfront_distribution.www_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.www_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}

```