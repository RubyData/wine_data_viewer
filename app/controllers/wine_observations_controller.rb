require 'pandas'

class WineObservationsController < ApplicationController
  def index
    @dataframe = load_dataframe
  end

  private def load_dataframe
    # TODO: fix pandas.rb
    WineObservation.to_pandas
  end

  helper_method def render_dataframe(df)
    highlight_max = lambda do |seq|
      max_p = seq == seq.max()
      max_p.tolist.map {|f| f ? 'background-color: yellow' : '' }
    end
    target_columns = df.columns[1..-1] # except wine_classes
    df.style.apply(highlight_max, subset: target_columns)._repr_html_.html_safe
  end
end
