# crumb :root do
#   link "Home", admin_root_path
# end

crumb :blog do
  link "部落格", admin_blog_categories_path
end

crumb :new_blog do
  link "新增分類", new_admin_blog_category_path
  parent :blog
end

crumb :edit_blog do |blog_category|
  link "重新命名", edit_admin_blog_category_path(blog_category)
  parent :blog
end

crumb :blog_category do |blog_category|
  link blog_category.name, [:admin, blog_category]
  parent :blog
end

crumb :article do |article|
	link article.title, [:admin, article.blog_category, article]
	parent :blog_category, article.blog_category
end

crumb :new_article do |blog_category|
	link "建立新文章", new_admin_blog_category_article_path(blog_category)
	parent :blog_category, blog_category
end

crumb :edit_article do |article|
	link "編輯文章", edit_admin_blog_category_article_path(article.blog_category, article)
	parent :article, article
end

# 
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).