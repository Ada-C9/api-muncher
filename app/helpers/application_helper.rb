module ApplicationHelper

  def image_url(recipe)
    ["<img src=", recipe.image, " alt=", recipe.label,">"].join.html_safe
  end

  def display_search?(fullpath)
    return fullpath != "/"
  end

  def render_date(date)
    date.strftime("%b %e, %Y")
  end

end
