module ApplicationHelper
  def style(&block)
    content_for :style, &block
  end

  def script(&block)
    content_for :script, &block
  end

  def modal(&block)
    content_for :modal, &block
  end
end
