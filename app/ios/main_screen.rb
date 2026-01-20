class MainScreen < UIViewController
  def viewDidLoad
    super
    view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "Hello from iOS!"
    @label.sizeToFit
    @label.center = view.center
    view.addSubview(@label)
  end
end
