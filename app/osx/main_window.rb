class MainWindow < NSWindow
  def init
    initWithContentRect(NSMakeRect(0, 0, 400, 300),
      styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
    self.title = "Hello from macOS!"
    center
    self
  end
end
