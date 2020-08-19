def api_v1_contract
  @api_v1_contract ||= RspecContracts::Contract.new(YAML.load_file(file_fixture("openapi.yml")))
end
