# Remember to restart your application after editing this file.

Gretel::Crumbs.layout do
  # Example crumbs:
  
  crumb :root do
     link "Home", root_path
  end
  
  crumb :productsamples do
    link "Samples", productsamples_path
  end
  
  crumb :samples do |samples|
    link samples.title, samples_path(samples)
    parent :productsamples, samples
  end
  
  crumb :sample do |sample|
    link sample.title, sample_path(sample.product, sample)
    parent :samples, sample.product
  end
  
  # crumb :project_issues do |project|
  #   link "Issues", project_issues_path(project)
  #   parent :project, project
  # end
  
  # crumb :issue do |issue|
  #   link issue.name, issue_path(issue)
  #   parent :project_issues, issue.project
  # end

end