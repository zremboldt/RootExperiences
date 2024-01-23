# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


features = [
  { name: "SkipPhone", constant: "AB_TEST_WEB_SKIP_PREFILL_PHONE_NUMBER", description: "When enabled, bucketed users will not be asked to provide their phone number." },
  { name: "Family plan login", constant: "AB_TEST_FAMILY_PLAN_LOGIN", description: "When enabled, bucketed users will see an app login screen that provides the option of joining an existing plan." },
  { name: "Coll/comp warning modal", constant: "AB_TEST_COLL_COMP_WARNING_MODAL", description: "When enabled, users who said that they are financing a vehicle and who are then bucketed, will see a warning modal when toggling coll/comp coverages off." },
  { name: "Skip report ordering", constant: "SKIP_PREFILL_REPORT_ORDERING", description: "When enabled, organic traffic in specified markets will be bucketed to skip prefill report ordering." },
  { name: "Multi-driver invite", constant: "AB_TEST_MULTI_DRIVER_INVITE", description: "When enabled, the PNI will be prompted after bind, to send SMS invites to others on their policy." },
  { name: "License scan", constant: "AB_TEST_LICENSE_SCAN", description: "When enabled, bucketed users will be prompted to either \"scan\" their driver's license or manually enter their information." },
  { name: "Address verification", constant: "AB_TEST_ADDRESS_VERIFICATION", description: "When enabled, bucketed users will not be hard blocked when entering an address the Lob doesn't recognize as residential." },
  { name: "Paid referrals", constant: "PAID_REFERRALS", description: "When enabled, users in enabled markets will be allowed to send and receive paid referrals." },
]

features.each do |feature_params|
  Feature.create!(feature_params)
end

# Create conditions and associate them with features
conditions = [
  { name: "Markets", conditions: "WI, IA, ME, AZ, KS", feature: Feature.find_by(constant: "SKIP_PREFILL_REPORT_ORDERING") },
  { name: "Markets", conditions: "OH, IA, TX", feature: Feature.find_by(constant: "AB_TEST_COLL_COMP_WARNING_MODAL") },
  { name: "Markets", conditions: "AK, AL, AR, AZ, CO, CT, DC, DE, FL, GA, HI, IA, IL, IN, KS, KY, LA, MD, MI, MN, MO, MS, MT, NC, NE, NH, NM, NV, NY, OH, OK, OR, PA, RI, SC, TN, TX, UT, VA, WA, WI", feature: Feature.find_by(constant: "PAID_REFERRALS") },
]

conditions.each do |condition_params|
  Condition.create!(condition_params)
end

# Create buckets and associate them with features
buckets = [
  { name: "BLOCKING_MODAL", value: 50, feature: Feature.find_by(constant: "AB_TEST_ADDRESS_VERIFICATION") },
  { name: "NON_BLOCKING_MODAL", value: 50, feature: Feature.find_by(constant: "AB_TEST_ADDRESS_VERIFICATION") },
  { name: "SKIP_REPORT_ORDERING", value: 10, feature: Feature.find_by(constant: "SKIP_PREFILL_REPORT_ORDERING") },
  { name: "DONT_SKIP_REPORT_ORDERING", value: 90, feature: Feature.find_by(constant: "SKIP_PREFILL_REPORT_ORDERING") },
  { name: "DONT_PROMPT_INVITE", value: 50, feature: Feature.find_by(constant: "AB_TEST_MULTI_DRIVER_INVITE") },
  { name: "PROMPT_INVITE_SERVER", value: 50, feature: Feature.find_by(constant: "AB_TEST_MULTI_DRIVER_INVITE") },
  { name: "PROMPT_INVITE_NATIVE", value: 0, feature: Feature.find_by(constant: "AB_TEST_MULTI_DRIVER_INVITE") },
]

buckets.each do |bucket_params|
  Bucket.create!(bucket_params)
end

# Create enableds and associate them with features
enabled = [
  { name: "Enabled", is_enabled: true, feature: Feature.find_by(constant: "SKIP_PREFILL_REPORT_ORDERING") },
  { name: "Enabled", is_enabled: false, feature: Feature.find_by(constant: "AB_TEST_WEB_SKIP_PREFILL_PHONE_NUMBER") },
  { name: "Enabled", is_enabled: true, feature: Feature.find_by(constant: "AB_TEST_COLL_COMP_WARNING_MODAL") },
  { name: "Enabled", is_enabled: true, feature: Feature.find_by(constant: "AB_TEST_FAMILY_PLAN_LOGIN") },
  { name: "Enabled", is_enabled: true, feature: Feature.find_by(constant: "AB_TEST_MULTI_DRIVER_INVITE") },
  { name: "Enabled", is_enabled: false, feature: Feature.find_by(constant: "AB_TEST_LICENSE_SCAN") },
  { name: "Enabled", is_enabled: true, feature: Feature.find_by(constant: "AB_TEST_ADDRESS_VERIFICATION") },
  { name: "Enabled", is_enabled: true, feature: Feature.find_by(constant: "PAID_REFERRALS") },
]

enabled.each do |enabled_params|
  Enabled.create!(enabled_params)
end