module ProductsHelper
  def colored_class(key)
    return 'alert-success' if key.to_sym == :create
    'alert-danger' if key.to_sym == :destroy
  end
end
