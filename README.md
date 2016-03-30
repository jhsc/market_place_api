#Rails 4 pure API

- Rails 4.2.6
- Ruby 2.3.0
- marketplaceapi_gemset
- Angular (Frontend)

Setting up Rbenv Gemset
--------------
Create a new project folder. Create rbenv gemset, and install appropiate gems needed for project.
```sh
mkdir market_place_api && cd
rbenv gemset create 2.1.3 marketplaceapi_gemset
echo "marketplaceapi_gemset" > .rbenv-gemsets
echo "2.3.0" > .rbenv-version

#working inside project directory
rbenv gemset active
gem install bundler rails --no-rdoc --no-ri
rbenv rehash
# optional to view downloaded gems
rbenv gemset list
gem list
```
