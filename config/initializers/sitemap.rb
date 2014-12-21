SitemapGenerator::Sitemap.default_host = "http://#{Spree::Config[:site_url]}"

## Store on S3 using Fog - Note must add fog to your Gemfile.
 SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(
                                      {
                                         aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                         aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                         fog_provider:          ENV['FOG_PROVIDER'],
                                         fog_directory:         ENV['FOG_DIRECTORY']
                                      }
                                   )

## Inform the map cross-linking where to find the other maps.
SitemapGenerator::Sitemap.sitemaps_host = "http://#{ ENV['FOG_DIRECTORY'] }.s3.amazonaws.com/"

SitemapGenerator::Sitemap.add_links do
  add_taxons
  add_products
end