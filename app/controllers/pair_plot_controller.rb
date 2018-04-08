require 'plotly'

class PairPlotController < ApplicationController
  DEFAULT_COLUMNS = %i[
    total_phenols
    flavanoids
    color_intensity
    OD280_OD315
    proline
  ].freeze

  def show
    @columns = DEFAULT_COLUMNS
    @dataframe = load_dataframe
  end

  def update
    @columns = params[:columns].reject(&:blank?)
    @dataframe = load_dataframe
    render 'show'
  end

  helper_method def render_pairplot(df, columns: nil, height: 800, width: 800)
    columns ||= DEFAULT_COLUMNS
    fig = Plotly::FF.create_scatterplotmatrix(
      df[[:wine_class, *columns]], index: :wine_class, diag: 'box',
      size: 4, height: height, width: width)
    Plotly::Offline.plot(fig, output_type: 'div').html_safe
  end

  private def load_dataframe
    WineObservation.to_pandas
  end
end
