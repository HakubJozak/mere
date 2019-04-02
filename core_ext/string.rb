class String

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end

  def gray
    colorize(37)
  end

  private
    def colorize(color_code)
      if $use_colors
        "\e[#{color_code}m#{self}\e[0m"
      else
        self
      end
    end

end
