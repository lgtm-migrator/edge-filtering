LoadFunctionLibrary ("libv3/UtilityFunctions.bf");
LoadFunctionLibrary ("libv3/IOFunctions.bf");

/*
 *What is being generated is controlled by the variable tree_matrix, currently defined as 
 *
 *internal_length = 0.005;
 *tip_length = 0;
 *
 *tree_matrix = {
 *    {1,-1,internal_length,tip_length}
 *    {2,1,internal_length,tip_length}
 *    {3,2,internal_length,tip_length}
 *    {4,3,internal_length,tip_length}
 *    {5,4,internal_length,tip_length}
 *    {6,5,internal_length,tip_length}
 *    {7,6,internal_length,tip_length}
 *    {8,7,internal_length,tip_length}
 *};
 *
 *Each ROW of the matrix defines a sequence to be generated. Columns are as follows
 *
 *[0] : node ID (unique numeric)
 *[1] : the source node for this node (if -1, this is the root)
 *[2] : the edge length between the parent and this node
 *[3] : the amount of within-host evolution that is accrued before the sequence is sampled.
 *
 *Current set up creates a chain 
 *
 *1->2…->8, with immediate sampling (tip_length == 0) and uniform between-node spacing (0.005 or 0.5%)
 * 
 * this doesnt work either 
 *DataSet ds = ReadDataFile(PROMPT_FOR_FILE, "Matrix", tree_matrix);
 *fprintf(DataSet)
*/


fscanf(PROMPT_FOR_FILE, "Matrix", tree_matrix);


site_rates = {{0,0,0,0,0,2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,2,0,2,0,0,1,2,1,1,2,0,0,0,2,1,2,0,0,0,1,1,0,0,1,0,0,2,2,1,1,0,1,1,0,0,1,0,0,1,1,0,1,1,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,1,0,0,1,0,0,2,1,0,2,2,2,1,1,0,2,1,1,0,0,0,2,0,2,1,0,0,0,0,1,1,0,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,2,1,0,1,2,0,1,2,2,2,2,0,1,0,0,1,0,0,2,0,0,1,0,0,2,1,0,1,0,1,1,1,1,1,1,1,1,0,0,1,0,0,0,0,0,2,1,0,1,2,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,1,0,1,1,0,1,0,0,1,1,0,1,2,0,0,0,0,2,0,0,1,0,0,1,1,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,1,1,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,1,0,2,1,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,1,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,1,1,0,1,2,1,1,0,0,1,0,0,1,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,0,0,1,0,0,1,0,0,2,0,0,1,0,0,1,1,0,1,0,1,1,1,0,1,0,0,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,1,0,1,0,0,0,0,0,2,0,0,0,0,1,1,0,0,1,0,0,2,0,0,1,1,0,1,0,1,1,0,0,1,0,0,0,0,0,1,0,0,1,1,0,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,2,1,0,0,1,0,0,1,0,0,2,0,0,1,0,0,0,0,0,1,1,0,2,0,0,1,1,0,1,0,0,1,0,0,0,0,0,1,0,0,1,0,0,2,1,0,1,0,0,1,1,0,1,1,1,1,1,1,0,0,1,2,0,1,1,0,0,0,0,0,1,0,0,0,0,0,1,1,0,2,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,1,0,0,2,0,0,1,1,0,1,0,0,2,1,0,1,1,0,1,2,1,1,1,1,2,0,0,1,0,0,2,0,0,1,0,0,1,0,0,1,0,0,1,0,0,2,0,0,1,0,0,1,0,0,1,0,0,1,2,2,1,0,0,1,0,0,0,0,1,1,0,0,1,0,0,1,0,0,2,1,1,1,0,0,2,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,2,0,0,1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,1,0,1,1,0,1,0,0,1,0,0,1,2,1,1,0,0,1,0,0,0,0,1,1,0,1,1,0,0,1,1,0,1,0,0,2,0,0,1,0,0,1,0,0,1,1,1,1,1,1,2,0,0,1,0,0,1,1,0,2,1,0,2,1,1,2,0,0,1,0,1,1,0,0,1,0,0,1,1,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,1,0,0,0,2,2,1,0,1,0,0,1,0,0,1,2,1,1,0,0,1,1,0,0,0,0,1,0,0,1,1,0,2,0,0,1,2,1,2,0,0,1,1,0,1,1,1,1,1,2,2,0,0,0,0,0,2,1,0,2,1,1,1,0,0,1,0,0,0,0,0,1,1,0,1,0,0,2,0,0,1,0,0,1,0,0,1,0,0,1,0,0,2,0,0,1,0,0,2,0,1,1,0,0,0,0,0,0,0,0,2,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,1,1,0,1,2,2,2,1,0,1,0,0,0,1,0,2,1,0,2,0,0,2,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,1,0,0,0,0,1,0,0,1,0,0,1,1,0,2,0,0,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,2,0,0,2,2,1,0,0,0,2,0,0,1,0,1,1,1,0,1,0,2,2,1,0,2,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,1,1,0,0,1,2,0,1,0,0,1,1,0,1,2,0,1,0,0,0,0,0,2,1,0,1,2,0,1,1,0,1,1,0,1,0,0,1,2,2,1,0,0,1,0,0,0,0,0,2,1,0,1,0,0,1,1,0,2,0,1,0,0,0,1,0,0,1,0,0,1,0,0,2,0,0,0,1,0,1,0,1,1,1,1,2,0,0,1,0,0,1,0,0,0,0,0,2,0,1,2,0,0,2,0,0,0,0,0,1,1,0,1,2,0,1,0,0,1,1,1,2,1,0,1,1,0,0,0,1,0,0,0,1,2,0,0,0,0,0,0,0,1,0,0,1,0,1,1,2,2,2,1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
rate_values = {{0.044159,1.456920,5.453997}};

TRY_NUMERIC_SEQUENCE_MATCH = 1;

function defineModel () {
    global AC:=0.2171371138076576;
    global AT:=0.09455823878956798;
    global CG:=0.1082814068731988;
    global GT:=0.1089456956632179;
    global CT:=1.167132112771781;
    
    GRM={4,4};
    GRM[0][1]:=AC*mu;
    GRM[0][2]:=mu;
    GRM[0][3]:=AT*mu;
    GRM[1][0]:=AC*mu;
    GRM[1][2]:=CG*mu;
    GRM[1][3]:=CT*mu;
    GRM[2][0]:=mu;
    GRM[2][1]:=CG*mu;
    GRM[2][3]:=GT*mu;
    GRM[3][0]:=AT*mu;
    GRM[3][1]:=CT*mu;
    GRM[3][2]:=GT*mu;


    vectorOfFrequencies={
    {0.3572325696826894}
    {0.1854362804881559}
    {0.2219376526639096}
    {0.235393497165245}
    }
    ;
    
    Model GRMModel=(GRM,vectorOfFrequencies);

    return 0;


}

AUTOMATICALLY_CONVERT_BRANCH_LENGTHS = 1;
ACCEPT_ROOTED_TREES = 1;

Topology TP = ((fake_root:0.0,root:0.0));

node_to_internal_id = {}; 

internal_length = 0.005;
tip_length = 0;

seq_count   = Rows (tree_matrix);
valid_names = {};

for (node = 0; node < seq_count; node +=1) {
    parent_id = tree_matrix [node][1];
    if (parent_id < 0) {
        parent_id = "root";
    } else {
        parent_id = node_to_internal_id[parent_id];
    }   
    nname = ""+ tree_matrix[node][0];
    iid = "hidden_" + nname;
    
    TP + {"WHERE": parent_id, "NAME" : iid, "LENGTH": tree_matrix[node][2]};
     
    TP + {"WHERE": iid, "NAME": nname, "LENGTH": tree_matrix[node][3]};
    node_to_internal_id [nname] = iid;
    valid_names [nname] = 1;
}

str = Format (TP,1,1);

_baseline_sequence  = "CCTCAAATCACTCTTTGGCAACGACCCATCGTCACAATAAAGATAGGAGGGCAACTAAGGGAAGCTCTATTAGACACAGGAGCAGATGATACAGTATTAGAAGACATAAGTTTGCCAGGAAGATGGAAACCAAAGATGATAGGGGGAATTGGAGGTTTTGTCAAAGTAAAACAGTATGATCAGATACCCATAGAAATCTGTGGACATAAAGTTATAGGTACAGTATTAGTAGGACCTACACCTGTCAACGTAATTGGAAGAAATCTGATGACTCAGCTTGGTTGCACTTTAAATTTTCCCATTAGTCCTATTGAAACTGTACCAGTAAAATTAAAGCCAGGAATGGATGGCCCAAGAGTCAAACAATGGCCATTGACAGAAGAAAAAATAAAAGCATTAGTAGAAATTTGTGCAGAACTGGAAAAGGAAGGAAAAATTTCAAAAATTGGGCCTGAAAATCCATACAATACTCCAATATTTGCTATAAAGAAAAAGAACAGCACGAAATGGAGAAAATTAGTAGATTTCAGAGAACTTAATAAGAGAACTCAAGACTTCTGGGAAGTTCAATTAGGAATACCACATCCCGCAGGGTTACCAAAGAACAAGTCAGTAACAGTACTGGATGTGGGTGATGCATATTTTTCAGTTCCCTTAGATAAAGACTTCAGGAAGTACACTGCATTTACCATACCTAGTATAAACAATGAGACACCAGGGATTAGATATCAGTACAATGTGCTTCCACAGGGATGGAAAGGATCACCAGCAATATTCCAAAGTAGCATGACAAAAATCTTAGAGCCTTTCAGAAAACAAAACCCAGATATAGTTATCTACCAATACATGGATGATTTGTATGTAGGATCTGACTTAGAAATAGGGCAGCATAGAACAAAAGTAGAGGAACTGAGACAACATCTGTTGAAGTGGGGATTTTACACACCAGACAAAAAACATCAGAAAGAACCTCCATTCCTTTGGATGGGTTATGAACTCCATCCAGATAAATGGACAGTACAGCCTATAGTGCTGCCAGAAAAAGACAGCTGGACTGTCAATGACATACAGAAGTTAGTGGGAAAATTGAATTGGGCAAGTCAGATTTACCCAGGGATTAAAGTAAAGCAATTATGTAAACTCCTTAGAGGAACCAAATCACTAACAGAAGTAATACCACTAACAGAAGAGGCAGAGCTAGAGCTGGCAGAAAACAGGGAGATTCTAAAACAACCAGTACATGGAGTGTATTATGACCCATCAAAAGACTTAATAGCAGAATTACAGAAGCAGGAGCAAGGC";
//_desired_divergence = 0.01;


defineModel ();

Tree T = str;

//fprintf (stdout, str, "\n", Format (T,1,1), "\n");

nuc_chars = {{"A","C","G","T"}{"1","","",""}};
rate_count = Columns (rate_values);

sim_strings = {};

branch_names = BranchName (T,-1);

for (ri = 0; ri < rate_count; ri += 1) {
    
    base_string = ""; base_string * 128;
    for (ci = 0; ci < Abs (_baseline_sequence); ci+=1) {
        if (site_rates[ci] == ri) {
            base_string * (_baseline_sequence[ci]);
        }
    }
    base_string * 0;
        
    if (ri) {
        rescale_tree ("T", "mu", branch_names, rate_values[ri]/rate_values[ri-1]);    
    } else {
        rescale_tree ("T", "mu", branch_names, rate_values[0]);
    }
    
    DataSet       sim_seq    = Simulate (T,vectorOfFrequencies,nuc_chars, base_string);
    DataSetFilter sim_filter = CreateFilter (sim_seq, 1);
    
    
    for (si = 0; si < sim_filter.species; si += 1) {
        GetString (seq_name, sim_filter, si);
        if (valid_names[seq_name]) {
            GetDataInfo (info, sim_filter, si);
            if (ri == 0) {
                sim_strings [seq_name] = {rate_count,1};
            } 
            (sim_strings [seq_name])[ri] = info;
        }  
    }
    
}




_returnstring = {}; 

valid_ids = Rows (valid_names);

for (si = 0; si < seq_count; si += 1) {
    seq_tag = valid_ids[si];
    _returnstring [seq_tag] = ""; _returnstring [seq_tag] * 128;
    
    counters         = {1, rate_count};

    for (ci = 0; ci < Abs (_baseline_sequence); ci+=1) {
        ri = site_rates[ci];
        _returnstring[seq_tag] * ( ((sim_strings[seq_tag])[ri])[counters[ri]]);
        counters[ri] += 1;
    }
    _returnstring [seq_tag] * 0;
}

//fprintf (stdout, _returnstring["1"], "\n");


function rescale_tree (tree, param, names, factor) {
    for (b = 0; b < Columns (names); b+=1) {
        ExecuteCommands (tree + "." + names[b] + "." + param + " = factor * " + tree + "." + names[b] + "." + param);
    }
    return 0;
}


utility.ForEachPair (_returnstring, "_name_", "_sequence_",
'
    console.log (">N" + _name_);
    console.log (_sequence_);
');

