# class Object
#   alias_method :overridden_initialize, :initialize

#   def initialize
#     overridden_initialize

#     if  !self.class.ancestors.include?(SimpleCov::Formatter::MultiFormatter)  &&
#         !self.class.ancestors.include?(SimpleCov::Formatter::HTMLFormatter)   &&
#         !self.class.ancestors.include?(Minitest::CompositeReporter)           &&
#         !self.class.ancestors.include?(Minitest::SummaryReporter)             &&
#         !self.class.ancestors.include?(Minitest::ProgressReporter)
#       freeze
#     end
#   end
# end
