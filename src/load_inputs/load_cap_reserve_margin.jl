@doc raw"""
	load_cap_reserve_margin!(setup::Dict, path::AbstractString, inputs::Dict)

Read input parameters related to planning reserve margin constraints
"""
function load_cap_reserve_margin!(setup::Dict, path::AbstractString, inputs::Dict)
    filename = "Capacity_reserve_margin.csv"
    df = load_dataframe(joinpath(path, filename))

    mat = extract_matrix_from_dataframe(df, "CapRes")
    inputs["dfCapRes"] = mat
    inputs["NCapacityReserveMargin"] = size(mat, 2)

    println(filename * " Successfully Read!")
end

@doc raw"""
	load_cap_reserve_margin_trans!(setup::Dict, inputs::Dict, network_var::DataFrame)

Read input parameters related to participation of transmission imports/exports in capacity reserve margin constraint.
"""
function load_cap_reserve_margin_trans!(setup::Dict, inputs::Dict, network_var::DataFrame)
    mat = extract_matrix_from_dataframe(network_var, "DerateCapRes")
    inputs["dfDerateTransCapRes"] = mat

    mat = extract_matrix_from_dataframe(network_var, "CapRes_Excl")
    inputs["dfTransCapRes_excl"] = mat
end
