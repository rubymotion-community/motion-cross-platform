describe "macOS Application 'motion-cross-platform'" do
  before do
    @app = NSApplication.sharedApplication
  end

  it "has a main menu" do
    @app.mainMenu.should.not.be.nil
  end
end
