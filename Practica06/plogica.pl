word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).

igual_22(P1,P2):-(word(P1,_,W1,_,_,_,_,_),W1=X),(word(P2,_,W2,_,_,_,_,_),W2=Y),X==Y.
igual_24(P1,P2):-(word(P1,_,W1,_,_,_,_,_),W1=X),(word(P2,_,_,_,W2,_,_,_),W2=Y),X==Y.
igual_26(P1,P2):-(word(P1,_,W1,_,_,_,_,_),W1=X),(word(P2,_,_,_,_,_,W2,_),W2=Y),X==Y.

igual_42(P1,P2):-(word(P1,_,_,_,W1,_,_,_),W1=X),(word(P2,_,W2,_,_,_,_,_),W2=Y),X==Y.
igual_44(P1,P2):-(word(P1,_,_,_,W1,_,_,_),W1=X),(word(P2,_,_,_,W2,_,_,_),W2=Y),X==Y.
igual_46(P1,P2):-(word(P1,_,_,_,W1,_,_,_),W1=X),(word(P2,_,_,_,_,_,W2,_),W2=Y),X==Y.

igual_62(P1,P2):-(word(P1,_,_,_,_,_,W1,_),W1=X),(word(P2,_,W2,_,_,_,_,_),W2=Y),X==Y.
igual_64(P1,P2):-(word(P1,_,_,_,_,_,W1,_),W1=X),(word(P2,_,_,_,W2,_,_,_),W2=Y),X==Y.
igual_66(P1,P2):-(word(P1,_,_,_,_,_,W1,_),W1=X),(word(P2,_,_,_,_,_,W2,_),W2=Y),X==Y.

devuelveV1(V1):-(igual_22(astante,astoria),igual_24(cobalto,astoria),igual_26(pistola,astoria),V1=astoria).
devuelveV2(V2):-(igual_42(astante,baratto),igual_44(cobalto,baratto),igual_46(pistola,baratto),V2=baratto).
devuelveV3(V3):-(igual_62(astante,statale),igual_64(cobalto,statale),igual_66(pistola,statale),V3=statale).

devuelveH1(H1):-(igual_22(astante,astoria),igual_42(astante,baratto),igual_62(astante,statale),H1=astante).
devuelveH2(H2):-(igual_24(cobalto,astoria),igual_44(cobalto,baratto),igual_64(cobalto,statale),H2=cobalto).
devuelveH3(H3):-(igual_26(pistola,astoria),igual_46(pistola,baratto),igual_66(pistola,statale),H3=pistola).

crossword(V1,V2,V3,H1,H2,H3):-devuelveV1(V1),devuelveV2(V2),devuelveV3(V3),devuelveH1(H1),devuelveH2(H2),devuelveH3(H3).