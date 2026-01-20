# Helpers shared between iOS and macOS (both use Cocoa/Foundation)
module CocoaHelpers
  def formatted_date(date)
    formatter = NSDateFormatter.alloc.init
    formatter.dateStyle = NSDateFormatterMediumStyle
    formatter.stringFromDate(date)
  end
end
