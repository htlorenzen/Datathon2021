%summarizes dadily demand for each store and plot them on one graph

data=readtable('training.csv');
store1_daily=zeros(1,363);
store2_daily=zeros(1,363);
store3_daily=zeros(1,363);
store4_daily=zeros(1,363);
n=1;

for i=1:363
    while ((n==1)||(data.(3)(n)>data.(3)(n-1))||(data.(2)(n)>data.(2)(n-1)))
        store1_daily(i)=store1_daily(i)+data.(4)(n);
        n=n+1;
        if data.(2)(n)>data.(2)(n-1)
            break
        end
    end
end

n=n+1;
a=n;

for i=1:363
    while ((n==a)||(data.(3)(n)>data.(3)(n-1))||(data.(2)(n)>data.(2)(n-1)))
        store2_daily(i)=store2_daily(i)+data.(4)(n);
        n=n+1;
        if data.(2)(n)>data.(2)(n-1)
            break
        end
    end
end

n=n+1;
a=n;

for i=1:363
    while ((n==a)||(data.(3)(n)>data.(3)(n-1))||(data.(2)(n)>data.(2)(n-1)))
        store3_daily(i)=store3_daily(i)+data.(4)(n);
        n=n+1;
        if data.(2)(n)>data.(2)(n-1)
            break
        end
    end
end

n=n+1;
a=n;

for i=1:363
    while ((n==a)||(data.(3)(n)>data.(3)(n-1))||(data.(2)(n)>data.(2)(n-1)))
        store4_daily(i)=store4_daily(i)+data.(4)(n);
        n=n+1;
        if data.(2)(n)>data.(2)(n-1)
            break
        end
        if n==5660
            break
        end
    end
end

hold on
plot(store1_daily)
plot(store2_daily)
plot(store3_daily)
plot(store4_daily)
legend('location 1','location 2','location 3','location 4')