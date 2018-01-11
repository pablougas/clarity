class V1::ClaimsController < ApplicationController
    skip_before_action :verify_authenticity_token
    require 'nokogiri'

    def new
        new_claim= Hash.from_xml(request.body)

        build_new_policy new_claim["FloodClaimsData"]

        if @policy.save
            render json:{status: 200, msg: "Created"}
        else
            render json:{status: 300, msg: "Error"}
        end
    end

    private

    def build_new_policy new_claim
        @policy = Policy.new
        @policy.number = new_claim["PolicyNumber"]
        @policy.effective_date = Date.strptime(new_claim["PolicyEffectiveDate"], '%m/%d/%Y')
        @policy.policy_type = new_claim["PolicyType"]
        @policy.agency = new_claim["CompanyNumber"]
        @policy.street_one = new_claim["PropertyLocAddrLine1"]
        @policy.street_two = new_claim["PropertyLocAddrLine2"]
        @policy.city = new_claim["PropertyLocCity"]
        @policy.state = new_claim["PropertyLocState"]
        @policy.zip = new_claim["PropertyLocZip"]
        @policy.occupancy_type = new_claim["OccupancyType"]

        @policy.build_insurer(
            name: new_claim["CompanyName"],
            street_one: new_claim["CompanyAddrLine1"],
            street_two: new_claim["CompanyAddrLine2"],
            city: new_claim["CompanyCity"],
            state: new_claim["CompanyState"],
            zip: new_claim["CompanyZip"]
        )

        @policy.build_insured(
            insured_type: new_claim["InsuredType"],
            full_name: new_claim["InsuredName"],
            first: new_claim["InsuredFirstName"],
            middle: new_claim["InsuredMiddleName"],
            last: new_claim["InsuredLastName"],
            home: new_claim["InsuredHomePhone"],
            work: new_claim["InsuredWorkPhone"],
            street_one: new_claim["InsuredAddrLine1"],
            street_two: new_claim["InsuredAddrLine2"],
            city: new_claim["InsuredCity"],
            state: new_claim["InsuredState"],
            zip: new_claim["InsuredZip"]
        )
        @claim = @policy.claims.build(
            number: new_claim["LossFileNumber"],
            period_begin: Date.strptime(new_claim["PolicyPeriodBeginDate"], '%m/%d/%Y'),
            period_end: Date.strptime(new_claim["PolicyPeriodEndDate"], '%m/%d/%Y'),
            loss_date: Date.strptime(new_claim["LossDate"], '%m/%d/%Y'),
            company_number: new_claim["CompanyNumber"],
            rating_method: new_claim["RatingMethod"],
            bldg_limit: new_claim["BldgCoverageLimit"].delete('$ ,'),
            bldg_ded: new_claim["BldgCoverageDed"].delete('$ ,'),
            bldg_res: new_claim["BldgCoverageReserve"].delete('$ ,'),
            con_limit: new_claim["ContentsCoverageLimit"].delete('$ ,'),
            con_ded: new_claim["ContentsCoverageDed"].delete('$ ,'),
            con_res: new_claim["ContentsCoverageReserve"].delete('$ ,'),
            icc_limit: new_claim["ICCCoverageLimit"].delete('$ ,'),
            icc_ded: new_claim["ICCCoverageDed"].delete('$ ,'),
            icc_res: new_claim["ICCCoverageReserve"].delete('$ ,'),
            floors: new_claim["NumberOfFloors"],
            enclosure_type: new_claim["EnclosureType"],
            con_location: new_claim["ContentsLocation"],
            flood_program: new_claim["FloodProgram"],
            flood_risk_zone: new_claim["FloodRiskZone"],
            flood_comm_number: new_claim["FloodCommunityNumber"],
            elevated_ind: new_claim["ElevatedInd"],
            low_floor_elev: new_claim["LowestFloorElevation"],
            flood_elev: new_claim["BaseFloodElevation"],
            construction_date: new_claim["ConstructionDate"],
            post_firm_ind: new_claim["PostFirmInd"],
            obstruction_code: new_claim["ObstructionCode"],
            num_units: new_claim["NumberOfUnits"],
            primary_res: new_claim["PrimaryResidenceInd"],
            condo_code: new_claim["CondoCode"],
            rep_val: new_claim["ReplacementValue"].delete('$ ,'),
            contact_first: new_claim["ContactFirstName"],
            contact_middle: new_claim["ContactMiddleName"],
            contact_last: new_claim["ContactLastName"],
            contact_home: new_claim["ContactHomePhone"],
            contact_work: new_claim["ContactWorkPhone"],
            contact_cell: new_claim["ContactCellPhone"]
        )
        @claim.build_agent(
            agent_id: new_claim["AgentID"],
            name: new_claim["AgentName"],
            street_one: new_claim["AgentAddrLine1"],
            street_two: new_claim["AgentAddrLine2"],
            city: new_claim["AgentCity"],
            state: new_claim["AgentState"],
            zip: new_claim["AgentZip"],
            phone: new_claim["AgentPhone"]
        )
        @claim.mortgagees.build(
            mortgagee_type: new_claim["FirstMortgageeType"],
            first: new_claim["FirstMortgageeName"],
            name: new_claim["FirstMortgageeFirstName"],
            middle: new_claim["FirstMortgageeMiddleName"],
            last: new_claim["FirstMortgageeLastName"],
            street_one: new_claim["FirstMortgageeAddrLine1"],
            street_two: new_claim["FirstMortgageeAddrLine2"],
            city: new_claim["FirstMortgageeCity"],
            state: new_claim["FirstMortgageeState"],
            zip: new_claim["FirstMortgageeZip"]
        )
        @claim.remarks.build(
            content: new_claim["Remarks"]
        )
        if new_claim["OtherMortgageeType"].present?
            @claim.mortgagees.build(
                mortgagee_type: new_claim["OtherMortgageeType"],
                first: new_claim["OtherMortgageeName"],
                name: new_claim["OtherMortgageeFirstName"],
                middle: new_claim["OtherMortgageeMiddleName"],
                last: new_claim["OtherMortgageeLastName"],
                street_one: new_claim["OtherMortgageeAddrLine1"],
                street_two: new_claim["OtherMortgageeAddrLine2"],
                city: new_claim["OtherMortgageeCity"],
                state: new_claim["OtherMortgageeState"],
                zip: new_claim["OtherMortgageeZip"]
            )
        end
    end

end
