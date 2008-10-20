module FixtureReplacement
  attributes_for :page do |p|
    p.title = String.random
    p.content = String.random
  end
end