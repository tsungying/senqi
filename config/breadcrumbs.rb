# crumb :root do
#   link "Home", admin_root_path
# end

# ================ 商品櫥窗 ================

crumb :product_category_list do
  link "商品櫥窗", admin_prod_categories_path
end

crumb :new_product_category do
  link "新增分類", new_admin_prod_category_path
  parent :product_category_list
end

crumb :edit_product_category do |prod_category|
  link "重新命名", edit_admin_prod_category_path(prod_category)
  parent :single_product_category, prod_category
end

crumb :single_product_category do |prod_category|
  link prod_category.name, [:admin, prod_category]
  parent :product_category_list
end

crumb :product do |product|
  link product.name, [:admin, product.prod_category, product]
  parent :single_product_category, product.prod_category
end

crumb :new_product do |prod_category|
  link "建立新商品", new_admin_prod_category_product_path(prod_category)
  parent :single_product_category, prod_category
end

crumb :edit_product do |product|
  link "編輯商品", new_admin_prod_category_product_path(product.prod_category, product)
  parent :product, product
end

# ================ 部落格 ================

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

# ================ 促銷活動 ================

crumb :event_category_list do
  link "促銷活動", admin_event_categories_path
end

crumb :new_event_category do
  link "新增分類", new_admin_event_category_path
  parent :event_category_list
end

crumb :edit_event_category do |event_category|
  link "重新命名", edit_admin_event_category_path(event_category)
  parent :single_event_category, event_category
end

crumb :single_event_category do |event_category|
  link event_category.name, [:admin, event_category]
  parent :event_category_list
end

crumb :event do |event|
  link event.title, [:admin, event.event_category, event]
  parent :single_event_category, event.event_category
end

crumb :new_event do |event_category|
  link "建立新活動", new_admin_event_category_event_path(event_category)
  parent :single_event_category, event_category
end

crumb :edit_event do |event|
  link "編輯活動", new_admin_event_category_event_path(event.event_category, event)
  parent :event, event
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