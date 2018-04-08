require 'pycall'

Plotly = PyCall.import_module('plotly')
module Plotly
  PyCall.import_module('plotly.figure_factory')
  PyCall.import_module('plotly.offline')

  FF = self.figure_factory
  Offline = self.offline
end
