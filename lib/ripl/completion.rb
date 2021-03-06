require 'bond'

module Ripl::Completion
  def before_loop
    super
    Bond.restart config[:completion]
  end
end
Ripl::Shell.send :include, Ripl::Completion
Ripl.config[:completion][:eval_binding] = lambda { Ripl.shell.binding }
