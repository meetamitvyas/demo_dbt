/* Model : example_team_details  */
{{ config(
    query_tag = 'example_team_details_Query'
) }}
{{
	config(
		tags = ["special"]
	)
}}

	with teams as(
		
		select * from {{ ref('example_teams') }}  -- Actual model
	),

	team_locations as (

		select * from {{ ref('team_locations') }} -- name of data file (in seeds)
	),
	
	final as (
	
		select 
			teams.team,
			team_locations.city,
			team_locations.state,
			teams.team = '{{ var('current_champions') }}' as is_champion
		from teams
		left join team_locations
			on team_locations.name = teams.team		
	
	)

	select * from final