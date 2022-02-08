class MyFailureApp < Devise::FailureApp
  def route(_scope)
    :root
  end
end
