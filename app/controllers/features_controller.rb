class FeaturesController < ApplicationController
  before_filter :authorize,only: [:index]
end
