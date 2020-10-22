Rails.application.config.to_prepare do
  Fueltype.data = [
      {:id => 1, :name => "レギュラー"},
      {:id => 2, :name => "ハイオク"},
      {:id => 3, :name => "軽油"},
  ]
end