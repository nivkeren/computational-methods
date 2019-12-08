import math
def solve_quadratic_equation (a,b,c):
    d = b ** 2 - 4 * a * c  # discriminant

    if d < 0:
        print("This equation has no real solution")
        return 0
    elif d == 0:
        x = (-b + math.sqrt(b ** 2 - 4 * a * c)) / 2 * a
        return (x,x)
    else:
        x1 = (-b + math.sqrt((b ** 2) - (4 * (a * c)))) / (2 * a)
        x2 = (-b - math.sqrt((b ** 2) - (4 * (a * c)))) / (2 * a)
        return (x1,x2)

#def main():
 #   a=int(input("Enter value for a:"))
  #  b=int(input("Enter value for b:"))
   # c=int(input("Enter value for c:"))
    #print(solve_quadratic_equation (a,b,c))

#if __name__=="__main__":
    #main()