class PagesController < ApplicationController
  def home
    @producers = Producer.all.order('name ASC')
    @producers_california = @producers.where(region: "California").limit(4)
    @producers_oregon = @producers.where(region: "Oregon").limit(4)
    @producers_france = @producers.where(country: "France").limit(4)

  end

  def contact
  end
end
