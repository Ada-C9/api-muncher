module ApplicationHelper
  def image_url(recipe)
    ["<img src=", recipe.image, " alt=", recipe.name,">"].join.html_safe
  end
end
