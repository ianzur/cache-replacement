## Cache Replacement Strategies

After building gem5 you can find all of previously built replacement policies in the folder: 
- `gem5/src/mem/cache/replacement_policies`

Also check out the file: 
- `cache-replacement/gem5/src/mem/cache/replacement_policies/ReplacementPolicies.py` 

To see the python class definitions for these replacement strategies. The are the available replacement strategies: 
1. Random
2. Least Recently Used (LRU)
3. Tree Pseudo Least Recently Used (TreePLRU)
4. Bimodal Insertion Policy (BIP)
5. LRU Insertion Policy (LIP)
6. Most Recently Used (MRU)
7. Least Frequently Used (LFU)
8. First-In, First-Out (FIFO)
9. Second-Chance
10. Not Recently Used (NRU)
11. Re-Reference Interval Prediction (RRIP)
12. Bimodal Re-Reference Interval Prediction (BRRIP)

For more information on the replacement policies [click here](http://www.gem5.org/Replacement_policy)

#### Notes:
We wanted to change this option from the command line so I built a dictionary to references strings to the class objects.

```Python
replacement_policy_dict = {
    'FIFO': FIFORP(),
    'SecondChance': SecondChanceRP(),
    'LFU': LFURP(),
    'LRU': LRURP(),
    'LIP': LIPRP(),
    'BIP': BIPRP(),
    'MRU': MRURP(),
    'NRU': NRURP(),
    'RRIP': RRIPRP(),
    'Random': RandomRP(),
    'BRRIP': BRRIPRP(),
    'TreePLRU': TreePLRURP(),
    }
```
