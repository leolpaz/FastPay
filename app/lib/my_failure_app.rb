class MyFailureApp < Devise::FailureApp
  def route(scope)
    :root
  end
end
