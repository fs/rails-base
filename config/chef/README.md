Deploy with Chef Solo
=====================

Install Ruby, RubyGems and Chef on a given host.
  
    knife prepare user@hostname
    
Modify if required `application` recipe in `site-cookbooks`.


Setup attributes for created node in `nodes` and use recipe.


    {
      "mysql": {
        "server_root_password": "123456"
      },
      "run_list": ["recipe[application]"]
    }
   
Upload the current chef repo to the target host and runs `chef-solo` on that host.


    knife cook user@hostname