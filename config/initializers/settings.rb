Cfp::Config.connected?

if Cfp::Config.ready?
  Cfp::Config.load_from_persistance

  Cfp::Config.call_for_papers_state = "closed" unless Cfp::Config.respond_to?(:call_for_papers_state)
end
