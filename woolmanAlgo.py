def initialize_table(relation, decomp_relation):
    table = []
    for decomp_rel in decomp_relation:
        row = []
        for attr in relation:
            if attr in decomp_rel:
                row.append('a' + str(relation.index(attr) + 1))
            else:
                row.append('b')
        table.append(row)
    return table


def check_lossy_lossless(relation, decomp_relation, functional_dependencies):
    table = initialize_table(relation, decomp_relation)
    print("Initial Table:")
    print_table(table, relation)
    
    repeat = 0
    while repeat < len(relation):
        for fd in functional_dependencies:
            deriving_attrs = fd[0]
            derived_attrs = fd[1]
            flag = 0
            for attr in derived_attrs:
                col_index = relation.index(attr)
                col_values = [row[col_index] for row in table]
                if 'a' + str(col_index + 1) in col_values and 'b' in col_values:
                    flag = 1
                    break
            if flag == 1:
                for attr in derived_attrs:
                    col_index = relation.index(attr)
                    for row in table:
                        if row[col_index] == 'b':
                            row[col_index] = 'a' + str(col_index + 1)
                repeat = 0
                print("\nChanged Table after checking dependency ",fd[0],"->",fd[1],":")
                print_table(table,relation)
                # break
            else:
                repeat += 1
                print("\nNo change in Table after checking dependency ",fd[0],"->",fd[1])
    
    lossless = any(all(attr.startswith('a') for attr in row) for row in table)
    
    print("\nFinal Table:")
    print_table(table, relation)
    
    if lossless:
        print("\nThe given decomposed relation is LOSSLESS.")
    else:
        print("\nThe given decomposed relation is LOSSY.")


def print_table(table, relation):
    num_rows = len(table)
    num_cols = len(relation)
    
    for row_num, row in enumerate(table):
        row_vals = []
        for col_num, attr in enumerate(row):
            if attr.startswith('a'):
                row_vals.append(attr)
            else:
                row_vals.append('b' + str(row_num + 1) + str(col_num + 1))
        print('\t'.join(row_vals))


# Example usage
if __name__ == "__main__":
    relation = ["A", "B", "C", "D", "E"]
    decomp_relation = ["AD", "AB", "BE", "CDE", "AE"]
    functional_dependencies = [["A", "C"], ["B", "C"], ["C", "D"], ["DE", "C"], ["CE", "A"]]
    
    check_lossy_lossless(relation, decomp_relation, functional_dependencies)