class PagesController < ApplicationController
  def home
    @producers = Producer.all.order('name ASC')
    @producers_california = @producers.where(region: "California").limit(6)
    @producers_oregon = @producers.where(region: "Oregon").limit(6)
    @producers_france = @producers.where(country: "France").limit(6)

  end

  def contact
  end
end
