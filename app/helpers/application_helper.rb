module ApplicationHelper
  def feather(name, **kwargs)
    tag.i(data: { feather: name, **kwargs[:data].to_h }, **kwargs.except(:data))
  end
end
