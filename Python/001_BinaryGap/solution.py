def solution(N):
    # write your code in Python 3.6
    b =  bin(N)[2:]
    
    parts = b.split("1")
    length = len(parts) 
    
    gap = 0
    for i in range(length):
        if parts[i] != '' and i>0 and i<length - 1:
            #print(i, parts[i])
            if len(parts[i]) > gap:
                gap = len(parts[i])

        
    #print(bin(N), b, parts, length, qtd)
    
    return gap

def solution2(N):
    return len(max(format(N, 'b').strip('0').split('1')))  