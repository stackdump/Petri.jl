# Copilot Instructions for Petri.jl

## Project Overview

Petri.jl is a Julia package for Petri net modeling and simulation. It provides a framework for building complex reaction networks using a simple DSL and generating ODE solutions and stochastic simulations using DifferentialEquations.jl.

This project follows Applied Category Theory principles for manipulating Petri nets as models.

## Language and Style

- **Language**: Julia (version 1.6+)
- **Naming Conventions**:
  - Use `PascalCase` for module and type names (e.g., `Model`, `NullPetri`)
  - Use `snake_case` for function names (e.g., `vectorfield`)
  - Use descriptive variable names
- **Documentation**: Use Julia docstrings (""") for all exported functions and types

## Project Structure

```
Petri.jl/
├── src/
│   ├── Petri.jl         # Main module file
│   ├── types.jl         # Type definitions
│   ├── solvers.jl       # Solver implementations
│   └── visualization.jl # Visualization utilities
├── test/
│   ├── runtests.jl      # Main test suite
│   └── solvers.jl       # Solver tests
├── examples/            # Example models
└── docs/                # Documentation
```

## Coding Standards

- Follow Julia style guidelines
- Keep functions focused and single-purpose
- Export only necessary functions and types from the main module
- Use type annotations where they improve clarity or performance
- Prefer immutable data structures when appropriate

## Dependencies

Core dependencies include:
- `Catlab` - Category theory framework
- `DiffEqBase` - Differential equations base
- `JumpProcesses` - Stochastic simulation
- `OrdinaryDiffEq` - ODE solvers
- `SparseArrays` - Sparse matrix support

## Testing

- All new features must include tests in the `test/` directory
- Use `@testset` to organize tests by functionality
- Run tests with: `julia --project=. -e 'using Pkg; Pkg.test()'`
- Tests use `Test`, `LabelledArrays`, and `Random` packages

## Building and Testing

1. **Instantiate the project**: `julia --project=. -e 'using Pkg; Pkg.instantiate()'`
2. **Run tests**: `julia --project=. -e 'using Pkg; Pkg.test()'`
3. **Build documentation**: `cd docs && julia --project=. make.jl`

## CI/CD

The project uses GitHub Actions with workflows defined in `.github/workflows/`:
- `julia_ci.yml` - Runs tests on PRs and pushes
- Uses AlgebraicJulia organization's shared workflows

## Code Review Preferences

- Ensure backward compatibility with existing API
- Check for proper error handling
- Verify mathematical correctness for Petri net operations
- Ensure tests cover edge cases
- Follow Julia performance best practices (avoid type instability, use @inbounds when safe)

## Examples

Good code example:
```julia
# Well-documented function with clear types
"""
    Model(states, transitions)

Create a Petri net model with the given states and transitions.
"""
function Model(states::Vector, transitions::Vector{Tuple})
    # Implementation
end
```

## Related Projects

- [AlgebraicPetri.jl](https://github.com/AlgebraicJulia/AlgebraicPetri.jl) - Higher-level APIs for Petri nets
- Part of the AlgebraicJulia ecosystem

## Notes for Contributors

- This project focuses on practical operationalization of Applied Category Theory
- Maintain consistency with the theoretical framework from Baez & Pollard's work
- When adding new features, consider how they fit into the category-theoretic structure
