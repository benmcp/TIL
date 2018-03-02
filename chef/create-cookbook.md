# Create Cookbook

Available generators:
chef generate app                  # Generate an application repo
chef generate cookbook             # Generate a single cookbook
chef generate recipe               # Generate a new recipe
chef generate attribute            # Generate an attributes file
chef generate template             # Generate a file template
chef generate file                 # Generate a cookbook file
chef generate lwrp                 # Generate a lightweight recourse/provider
chef generate repo                 # Generate a Chef code repository
chef generate policyfile           # Generate a Policyfile for use with      /     commands
chef generate generator            # Copy ChefDK's generator cookbook to customize
chef generate build-cookbook       # Generate a build cookbook for delivery command

Pro-Tip 4: Manage your dependencies

One way to manage your dependencies is to ”vendor” the dependency into
your repository:

- knife cookbook site install httpd # Copy the httpd cookbook from the Supermarket

- knife cookbook upload httpd # Upload the dependency into Chef Server
- You can only upload one cookbook at a time with knife cookbook upload

Another way to manage your dependencies is with Berkshelf
- Berkshelf is included with the ChefDK with the berks command
° You can specify a public or private Supermarket within your Berksfile and declare
cookbooks that you depend on
' berks install # Fetch dependencies from the Supermarket

- berks upload it Upload all dependencies and sub—dependencies to Chef Server
' Supply the SSL_CERT_F|LE environment variable or pass in the ~no-ssl-Verify flag to configure
berks to communicate with Chef Server

