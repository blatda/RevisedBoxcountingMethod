classdef Fractal
    %FRACTAL class representing generated fractal
    
    properties
        Depth
        Dimension
        Base
        Name
        OrigMatrix
    end
    
    methods
        function self = Fractal(fill, base, letter, depth)
          X = 1;
          if nargin < 2
              error('Bad input to Fractal constructor!')
          end
          if nargin < 3
                 letter = ''; 
          end
          self.Name = [num2str(fill) num2str(base) letter]; 
          self.Dimension = log(fill)/log(base);
          if base == 2
              if nargin < 4
                 depth = 11; 
              end
              for i=1:depth
                  switch fill
                      case 2 %F22
                        X = [X, 0*X; 0*X, X];
                      case 3 %F32
                        X = [X, 0*X; X, X];
                  end
              end
          elseif base == 3
              if nargin < 4
                 depth = 7; 
              end
              for i=1:depth
                  switch fill
                      case 2
                          switch letter
                              case 'a' %F23a
                                  X = [X, 0*X, 0*X; 0*X, 0*X, X; 0*X, 0*X, 0*X];
                              case 'b' %F23b
                                  X = [X, 0*X, 0*X; 0*X, 0*X, 0*X; 0*X, 0*X, X];
                              otherwise
                                  error('Unknown fractal!')
                          end
                      case 3
                        switch letter
                              case 'a' %F33a
                                  X = [X, 0*X, 0*X; 0*X, X, 0*X; 0*X, 0*X, X];
                              case 'b' %F33b
                                  X = [X, X, 0*X; 0*X, 0*X, X; 0*X, 0*X, 0*X];
                              case 'c' %F33c
                                  X = [X, X, 0*X; 0*X, 0*X, 0*X; 0*X, 0*X, X];
                              case 'd' %F33d
                                  X = [X, X, 0*X; 0*X, 0*X, 0*X; 0*X, X, 0*X];
                              case 'e' %F33e
                                  X = [X, 0*X, X; 0*X, X, 0*X; 0*X, 0*X, 0*X];
                              case 'f' %F33f
                                  X = [X, 0*X, X; 0*X, 0*X, 0*X; X, 0*X, 0*X];
                              case 'g' %F33g
                                  X = [X, 0*X, X; 0*X, 0*X, 0*X; 0*X, X, 0*X]; 
                              case 'h' %F33h
                                  X = [0*X, X, 0*X; X, 0*X, 0*X; 0*X, 0*X, X];
                              otherwise
                                  error('Unknown fractal!')                        
                        end
                      case 4
                        switch letter
                              case 'a' %F43a
                                  X = [X, 0*X, X; 0*X, 0*X, 0*X; X, 0*X, X];
                              case 'b' %F43b
                                  X = [0*X, X, 0*X; X, 0*X, X; 0*X, X, 0*X]; 
                              case 'c' %F43c
                                  X = [X, X, 0*X; X, 0*X, 0*X; 0*X, 0*X, X];
                              case 'd' %F43d
                                  X = [X, X, X; 0*X, 0*X, 0*X; 0*X, X, 0*X];  
                              case 'e' %F43e
                                  X = [X, X, X; 0*X, 0*X, 0*X; 0*X, 0*X, X]; 
                              otherwise
                                  error('Unknown fractal!')                        
                        end
                      case 5
                          switch letter
                              case 'a' %F53a
                                  X = [X, 0*X, X; 0*X, X, 0*X; X, 0*X, X];
                              case 'b' %F53b
                                  X = [0*X, X, 0*X; X, X, X; 0*X, X, 0*X]; 
                              case 'c' %F53c
                                  X = [X, X, 0*X; X, X, 0*X; 0*X, 0*X, X]; 
                              case 'd' %F53d
                                  X = [X, X, 0*X; X, 0*X, 0*X; X, 0*X, X];
                              case 'e' %F53e
                                  X = [X, X, 0*X; 0*X, 0*X, X; X, X, 0*X];    
                              case 'f' %F53f
                                  X = [X, X, 0*X; 0*X, X, 0*X; X, 0*X, X];
                              case 'g' %F53g
                                  X = [X, X, 0*X; 0*X, 0*X, X; X, 0*X, X];
                              case 'h' %F53h
                                  X = [X, X, 0*X; X, 0*X, X; 0*X, 0*X, X];
                              case 'i' %F53i
                                  X = [X, X, 0*X; 0*X, X, 0*X; 0*X, X, X];
                              case 'j' %F53j
                                  X = [0*X, X, 0*X; 0*X, X, 0*X; X, X, X]; 
                              case 'k' %F53k
                                  X = [0*X, X, 0*X; 0*X, X, X; X, X, 0*X]; 
                              otherwise
                                  error('Unknown fractal!')                        
                          end
                      case 8
                          X = [X, X, X; X, 0*X, X; X, X, X];
                      otherwise
                          error('Unknown fractal!')
                  end  
              end
          else
              error('Unable to generate fractal of that base!')
          end  
          self.OrigMatrix = X;
          self.Depth = depth;
        end
    end
    
end

