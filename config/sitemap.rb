# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.cositascaseras.com"

SitemapGenerator::Sitemap.sitemaps_host = "https://cositas-caseras.s3.amazonaws.com/sitemap-generator/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'weekly'
  add '/acerca', :changefreq => 'weekly'
  add '/contacto', :changefreq => 'weekly'
  add '/privacidad', :changefreq => 'weekly'

  Store.all.each do |store|
    add "/stores/#{store.slug}", :changefreq => "daily"
  end
end
