class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super

    layout = Android::Widget::LinearLayout.new(self)
    layout.gravity = Android::View::Gravity::CENTER

    label = Android::Widget::TextView.new(self)
    label.text = "Hello from Android!"
    layout.addView(label)

    self.contentView = layout
  end
end
