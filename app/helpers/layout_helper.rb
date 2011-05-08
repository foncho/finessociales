# coding: UTF-8
module LayoutHelper
  def render_navigation
    content_tag(:ul) do
      concat content_tag(:li, link_to('Inicio',root_path), :class => (current_page?(root_path)) ? 'selected first' : 'first')
      concat content_tag(:li, link_to('Colectivos',groups_path), :class => (current_page?(groups_path)) ?  'selected' : nil)
      concat content_tag(:li, link_to('Organizaciones',organizations_path), :class => (current_page?(organizations_path)) ? 'selected' : nil)
      concat content_tag(:li, link_to('Acerca de',about_path), :class => (current_page?(about_path)) ? 'selected' : nil)
    end
  end
end
