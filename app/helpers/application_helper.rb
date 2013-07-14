module ApplicationHelper
  def full_title(page_title)
    base_title = "Home of Embroibered Products - Distribucion Es Guadalquivir"
    if page_title.empty?
      base_title
    else
      "#{page_title} - Distribucion Es Guadalquivir"
    end    
  end
  
end
