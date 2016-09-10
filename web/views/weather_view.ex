defmodule Anka.WeatherView do
  require Logger
  use Anka.Web, :view  

  def render("index.json", %{temp: output}) do
    %{data: output}
  end

  def render("create.json", %{}) do
    %{}
  end
end
