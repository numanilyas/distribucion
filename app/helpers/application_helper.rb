module ApplicationHelper
  def full_title(page_title)
    base_title = "Hogar de Productos Embroibered - Distribuciones Guadalquivir"
    if page_title.empty?
      base_title
    else
      "#{page_title} - Distribuciones Guadalquivir"
    end    
  end
  
end
