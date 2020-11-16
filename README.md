# robcxyz-blog
Blog made in [Tinkerer](https://github.com/vladris/tinkerer), a [Sphinx](https://github.com/sphinx-doc/sphinx) theme for blogging. 

```
cd blog 
tinkerer -p <the name of your post>
```

#### Local Build

```bash
tinker  --build 
python3 -m http.server 8001
```

### Deploying your own blog

#### Deploy static website 

```shell script
cd terragrunt 
# install terragrunt v0.25.x
terragrunt apply 
```

Keep the outputs handy as you'll need a few of them. 

#### Setup updates to website on each commit

Sign up for CircleCI and register repo. 

Update the following to reflect your new bucket for the website. 
```yaml
      - aws-s3/sync:
          from: blog
          to: 's3://robc.xyz'  # <- THIS
          overwrite: true
          aws-region: AWS_DEFAULT_REGION
```

Take the relevent outputs and put them into circleci environment variables. 

- CLOUDFRONT_DISTRIBUTION_ID
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

Where the credentials have access to push to the S3 bucket and update the cloudfront distribution. 

Each commit should now 

# Resources 

- [insight-infrastructure/terraform-aws-cloudfront-static-site](github.com/insight-infrastructure/terraform-aws-cloudfront-static-site)
