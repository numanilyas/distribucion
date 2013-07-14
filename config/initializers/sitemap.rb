DynamicSitemaps::Sitemap.draw do
  
  # default per_page is 50.000 which is the specified maximum.
  # per_page 10

  url root_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  url productsamples_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  
  url aboutus_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 0.8
  url contactus_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 0.8
  url howwework_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 0.8
  url pricing_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 0.8
  url faqs_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 0.8
  
  url newquote_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  
  #new_page!
  
  Product.all.each do |product|
    url samples_url(product), :last_mod => product.updated_at, :change_freq => 'daily', :priority => 1
  end
  
  #new_page!
  
  ProductSample.all.each do |sample|
    url sample_url(sample.product.slug, sample), :last_mod => sample.updated_at, :change_freq => 'daily', :priority => 1
  end

  # new_page!
  
  # autogenerate  :products, :categories,
  #               :last_mod => :updated_at,
  #               :change_freq => 'monthly',
  #               :priority => 0.8
                
  # new_page!
  
  # autogenerate  :users,
  #               :last_mod => :updated_at,
  #               :change_freq => lambda { |user| user.very_active? ? 'weekly' : 'monthly' },
  #               :priority => 0.5
  
end