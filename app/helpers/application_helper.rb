# app/helpers/application_helper.rb
module ApplicationHelper
  def flash_class(type)
    case type
    when 'notice' then 'bg-green-100 border-l-4 border-green-500 text-green-700 p-4'
    when 'alert' then 'bg-red-100 border-l-4 border-red-500 text-red-700 p-4'
    else type
    end
  end
end
