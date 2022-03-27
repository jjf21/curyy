module ApplicationHelper
  def feather(name, **kwargs)
    tag.i(data: { feather: name, **kwargs[:data] }, **kwargs.except(:data))
  end
end
