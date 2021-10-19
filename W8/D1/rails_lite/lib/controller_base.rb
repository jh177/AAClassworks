require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    # redirect_app = Proc.new do |env|
    #   ['302', {'Content-type' => 'text/html', 
    #   'Location' => 'url'}, []]
    # end
    res.status = 302
    res.location = url
    raise "error" if self.already_built_response?
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    res['Content-Type'] = content_type
    res.write(content)
    raise "error" if self.already_built_response?
    @already_built_response = true
  end

  def underscore(string)
    word = string.split("Controller")
    word[0].downcase + "_" + "controller"
  end
  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    file_path = "views/#{underscore(self.class.to_s)}/#{template_name}.html.erb"

    file = File.open(file_path)
    template = file.read
    # self.class.to_s.underscore

    # file_dir = File.dirname("")   #=> "/home/gumby/work"
    # File.join(file_dir, "#{template_name}.html.erb")

    result = ERB.new('<%= template %>').result(binding)
    render_content(result, "text/html")
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

